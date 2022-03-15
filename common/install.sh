   ##########################################################################################
# Custom Logic
##########################################################################################

mkdir "$MODPATH"/system
mkdir "$MODPATH"/system/product
mkdir "$MODPATH"/system/product/overlay

ui_print "****************************************"
ui_print "- REPLACING OLD FILES CREATING NEW PILL!"
ui_print "- INSTALLING PLEASE WAIT!"
sleep 1
ui_print "- INSTALLATION IS FINISHED SUCCESSFULLY!"
ui_print "- DONE! REBOOT NOW!"
ui_print "****************************************"

cp -rf "$MODPATH"/Pill/pill.apk "$MODPATH"/system/product/overlay/
rm -rf "$MODPATH"/Pill