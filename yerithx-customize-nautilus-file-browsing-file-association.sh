#!/bin/bash

xdg-mime default xfig.desktop image/x-xfig

xdg-mime default designer-qt5.desktop application/x-designer

xdg-mime default texmaker.desktop text/x-tex

xdg-mime default xfig.desktop application/x-xfig

xdg-mime default YR_QDOT.desktop text/vnd.graphviz

xdg-mime default yri-qvge.desktop application/octet-stream

xdg-mime default gdebi.desktop application/vnd.debian.binary-package

gsettings set org.gnome.nautilus.preferences executable-text-activation  "ask"

gsettings set org.gnome.nautilus.list-view default-column-order  "['name', 'type', 'size', 'owner', 'group', 'permissions', 'mime_type', 'where', 'date_modified', 'date_modified_with_time', 'date_accessed']"

gsettings set org.gnome.nautilus.list-view use-tree-view true

gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'type', 'size', 'date_modified']"
