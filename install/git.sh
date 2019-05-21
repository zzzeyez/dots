#!/usr/bin/env bash
# install my git repos

scripts="${HOME}/scripts" 

# color escapes
red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
blu="\e[34m"
pur="\e[35m"             
cyn="\e[36m"                                       
gry="\e[90m"
rst="\e[0m"
bar="▔▔▔▔▔▔"       
bar="$red$bar$grn$bar$ylw$bar$blu$bar$pur$bar$cyn$bar$rst"

clone() {                                                      
	printf "\n$1\n$bar\n"
	if [[ ! -d "$scripts/$1" ]] ; then                         
		printf "\ncloning $1 into $scripts/$1\n"
		git clone "https://github.com/zzzeyez/$1.git" "$scripts/$1"
	fi                                                             
}                                                                      

mkdir -p "$scripts"                                                        
clone dots                                                                 
clone bin                                                                  
clone pecan                                                                
clone xanthia                                                              
clone pollen                                                               
clone new-roses                                                            
clone colorlovers
