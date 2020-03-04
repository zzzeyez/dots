import { Disposable } from 'vscode-languageserver-protocol';
/**
 * Append messages to the output channel and format it with a title
 *
 * @param message The message to append to the output channel
 */
export declare function addToOutput(message: string, type?: string): void;
/**
 * Execute a callback safely, if it doesn't work, return default and log messages.
 *
 * @param cb The function to be executed,
 * @param defaultText The default value if execution of the cb failed
 * @param fileName The filename of the current document
 * @returns {string} formatted text or defaultText
 */
export declare function safeExecution(cb: (() => string) | Promise<string>, defaultText: string, fileName: string): string | Promise<string>;
/**
 * Setup the output channel and the statusBarItem.
 * Create a command to show the output channel
 *
 * @returns {Disposable} The command to open the output channel
 */
export declare function setupErrorHandler(): Disposable;
