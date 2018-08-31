function fish_prompt
  test $status -ne 0;
    and set -l colors 600 900 c00
    or set -l colors 333 666 aaa

  set -l pwd (prompt_pwd)
  set -l base (basename "$pwd")

  set -l expr "s|~|"(fst)"^^"(off)"|g; \
               s|/|"(snd)"/"(off)"|g;  \
               s|"$base"|"(fst)$base(off)" |g"

  echo -n (echo "$pwd" | sed -e $expr)(off)

  printf (snd)" ["(begin
    set -l shell_version (echo $PYENV_VERSION)
      if test -n $shell_version
        echo (fst)$shell_version
      else
         set -l global_version (cat $HOME/.pyenv/version)
         if [ $global_version != "system" ]
           echo (fst)$global_version
         else
           echo (fst)system
         end
      end
  end)(snd)"] "(off)

  for color in $colors
    echo -n (set_color $color)">"
  end

  echo -n " "
end
