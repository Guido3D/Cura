// Copyright (c) 2016 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.1

import UM 1.6 as UM
import Cura 1.0 as Cura

import "../Dialogs"

Menu
{
    id: menu
    title: catalog.i18nc("@title:menu menubar:file", "Open File(s)...")
    iconName: "document-open-recent";


    Instantiator
    {
        id: fileProviders
        model: UM.FileProviderModel { }
        MenuItem
        {
            text:
            {
                return model.displayText;
            }
            onTriggered:
            {
                if (model.index == 0)  // The 0th element is the "From Disk" option, which should activate the open local file dialog
                {
                    Cura.Actions.open.trigger()
                }
                else
                {
                    fileProviders.model.trigger(model.name);
                }
            }
            shortcut: model.shortcut
        }
        onObjectAdded: menu.insertItem(index, object)
        onObjectRemoved: menu.removeItem(object)
    }
}
