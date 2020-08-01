#!/bin/bash
#
# clone a git repository and set all of the ownership and permissions to make opsi work
#
# exit when any command fails
set -e
# if no arguments, display calling sequence
exit_code=1
if [ $# -eq 0 ]
  then
    echo "Usage: makeclone.sh GITHUB_CLONE PRODUCT_NAME"
    echo "Clone an opsi product into the workbench and set file rights."
    echo "Note that both arguments are Required!"
    echo ""
    echo "With neiher GITHUB_CLONE, nor PODUCT_NAME arguments - display this output."
    echo ""
    echo "  GITHUB_CLONE           The repository clone info provided by Github (paste in from web)."
    echo "  PODUCT_NAME            The name of the opsi product being cloned (also the name of the"
    echo "                         new folder). The script will cd to this folder and list its "
    echo "                         contents if successful."
    echo ""
    echo "Example:"
    echo "  ./makeclone.sh git@github.com:ICA-IT/ica-set-net.git ica-set-net"
    exit $exit_code
fi
exit_code=2
if [ -z "$1" ]
  then
    echo "No Github clone argument supplied"
    exit $exit_code
fi
exit_code=3
if [ -z "$2" ]
  then
    echo "No opsi product name supplied"
    exit $exit_code
fi
cd /var/lib/opsi/workbench
echo cloning $1
git clone $1
#sudo chown -R opsiconfd:pcpatch $2
#sudo chmod -R g+rwx $2
sudo opsi-set-rights $2
cd $2
sudo chown -R johnkuras .git*
ls -la
