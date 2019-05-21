#!/usr/bin/env bash
# install my git repos

scripts="${HOME}/scripts" 

clone() {                                                      
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
