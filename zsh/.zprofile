##########################################    
#                      ??   ?  ???       #    
#                     ???   ?  ???       #    
#?????????  ???? ??? ????  ??   ??   ??? #    
#  ?? ?? ?? ??  ?? ?? ??    ?   ??  ?????#    
# ??  ?? ?? ?   ?? ?? ??    ?   ??  ?????#    
#?????????? ?   ????? ??  ????? ??? ?????#    
#?????????  ?    ???  ??  ?????  ??  ??? #    
#     ??                                 #    
#                                        #    
##########################################    
#                                        #    

export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8 
export PET_GITLAB_ACCESS_TOKEN=$(pass snippets-api)

# Start X at login    
    
if [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then    
    exec startx    
fi   
