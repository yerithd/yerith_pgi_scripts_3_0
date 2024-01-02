#!/bin/bash

sudo sed -i 's/GtkScrollbar::trough-border = 0/GtkScrollbar::trough-border = 1/' /usr/share/themes/Adwaita/gtk-2.0/main.rc
sudo sed -i 's/GtkScrollbar::has-backward-stepper         = 0/GtkScrollbar::has-backward-stepper         = 1/' /usr/share/themes/Adwaita/gtk-2.0/main.rc
sudo sed -i 's/GtkScrollbar::has-forward-stepper          = 0/GtkScrollbar::has-forward-stepper          = 1/' /usr/share/themes/Adwaita/gtk-2.0/main.rc
sudo sed -i 's/GtkScrollbar::stepper-size                 = 0/GtkScrollbar::stepper-size                 = 1/' /usr/share/themes/Adwaita/gtk-2.0/main.rc
