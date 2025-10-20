# .bashrc
#
# Sources common settings from .bashrc.common and adds system-specific
# customizations.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return ;;
esac

if [[ -f $HOME/.bashrc.common ]]; then
  source .bashrc.common
fi


