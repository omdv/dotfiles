# intellegently extract archives based on extension. 
function extract {  
   
   file=$1
   dir=$2
 
   if [[ -n $dir ]]; then
      mkdir -p $dir; 
      echo Extracting $1 into $2 ...
   else 
      echo Extracting $1 ...
   fi
 
   if [[ ! -f $1 ]] ; then
      echo "'$1' is not a valid file"
   else
      case $1 in
         *.tar.bz2)   
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc" 
             echo $cmd
             eval ${cmd}
             ;;   
         *.tar.gz)    
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzvf $1 $dc"; 
             echo $cmd;
             eval ${cmd}
             ;;
         *.tar)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar vxf $1 $dc";
             echo $cmd;
             eval ${cmd}
             ;;
         *.tbz2)      
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc";
             echo $cmd; 
             eval ${cmd}
             ;;  
         *.tgz) 
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;    
         *.bz2)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar jf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;     
         *.zip)       
             if [[ -n $dir ]]; then dc="-d $dir"; fi
             cmd="unzip $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.gz)
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar zf $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.7z)        
             #TODO dir
             cmd="7z x -o$dir $1"; 
             echo $cmd; 
             eval ${cmd} 
             ;;
         *.rar)       
             #TODO Dir
             cmd="unrar x $1 $dir";
             echo $cmd;
             eval ${cmd}
             ;;
         *)           
            echo "'$1' cannot be extracted via extract()" 
            ;;
         esac
   fi
}
