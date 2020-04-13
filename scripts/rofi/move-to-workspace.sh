function gen_common_workspaces() {
    cat ~/scripts/rofi/common-workspaces.txt
}
function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}
WORKSPACE=$({ gen_workspaces; gen_common_workspaces; } | sort | uniq | trofi -dmenu -p "Move to workspace")

if [ -n "${WORKSPACE}" ]
then
  i3-msg move container to workspace "${WORKSPACE}" &&
  i3-msg workspace "${WORKSPACE}"
fi
