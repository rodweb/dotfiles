function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}

WORKSPACE=$( (echo empty; gen_workspaces) | trofi -dmenu -p "Select workspace")

if [ x"empty" = x"${WORKSPACE}" ]
then
  OLD="temp"
  # i3-msg workspace "$OLD"
  NEW=$(zenity --text="Rename" --entry --entry-text="$OLD")
  echo "rename workspace \"$OLD\" to \"$NEW\""
  # i3-msg "rename workspace \"$OLD\" to \"$NEW\""
  i3-msg workspace "$NEW"
elif [ -n "${WORKSPACE}" ]
then
  i3-msg workspace "${WORKSPACE}"
fi
