# Copyright 2016 prussian <genunrest@gmail.com>>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# NOTE:
# This program requires terminal-notifier
# can be aquired via homebrew (brew install terminal-notifier)
# on linux, you need libnotify with a notifications server and notify-send

use strict;
use Irssi;

our $VERSION = '2.0.0';
our %IRSSI = (
    authors     => 'prussian',
    contact     => 'genunrest@gmail.com',
    name        => 'mac-notify',
    description => 'Sends notifications for macOS, see README.md',
    license     => 'Apache 2.0',
);

my $notify_chan;
my $notify_priv;
my $help = '
/set notify_priv <level>
/set notify_chan <level>
where <level> is:
    never  - never notify for these events
    active - never notify for these events if the channel/user is the active window
    always - anytime highlighed or private message, active window or not
';

sub setup {
    $notify_chan = Irssi::settings_get_str('notify_chan');
    $notify_priv = Irssi::settings_get_str('notify_priv');
}

sub send_notify {
    my ($msg, $title) = @_;
    my $pid = fork();
    if ($pid == 0) {
        if ($^O eq "darwin") {
            #exec("terminal-notifier", "-message", "\\".$msg, "-title","\\".$title);
            exec("notify-send", "--", "($title) $msg");
        }
        else {
            exec("notify-send", "--", $title, $msg);
        }
    }
    else {
        Irssi::pidwait_add($pid);
    }
}

sub privmsg {
    if ($notify_priv eq 'never') { 
        return;
    }
    my ($server, $msg, $nick, $address) = @_;
    my $window = Irssi::active_win();

    # we are looking at the query window of this user
    if ($notify_priv eq 'active' && 
          $window->{active}->{name} eq $nick) {
        return;
    }
    
    send_notify($msg, $nick);
}

sub highlight {
    if ($notify_chan eq 'never') {
        return;
    }
    my ($dest, $text, $msg) = @_;
    my $server = $dest->{server};
    my $window = Irssi::active_win();

    # Check if we should notify user of message
    # if message is notice or highligh type
    # if the channel belongs to the current server
    if (!($server &&
            $dest->{level} & (MSGLEVEL_HILIGHT | MSGLEVEL_NOTICES) &&
            $server->ischannel($dest->{target}))) {
        return;
    }

    if ($notify_chan eq 'active' && 
          $window->{refnum} == $dest->{window}->{refnum}) {
        return;
    }

    send_notify($msg, $dest->{target});
}

Irssi::settings_add_str($IRSSI{name}, 'notify_priv', 'active');
Irssi::settings_add_str($IRSSI{name}, 'notify_chan', 'always');

Irssi::signal_add('setup changed' => \&setup);
Irssi::signal_add_last('message private' => \&privmsg);
Irssi::signal_add_last('print text' => \&highlight);

Irssi::command_bind('help', sub {
        if ($_[0] eq $IRSSI{name}) {
            Irssi::print($help, MSGLEVEL_CLIENTCRAP);
            Irssi::signal_stop();
        }
    }
);

setup();
