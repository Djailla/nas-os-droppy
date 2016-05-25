#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import sys


def update_port_info(value):

    with open('/root/.droppy/config/config.json', 'r+') as settingsData:
        settings = json.load(settingsData)
        settings['listeners'][0]['port'] = value

        settingsData.seek(0)
        settingsData.write(
            json.dumps(
                settings,
                indent=2,
                sort_keys=True
            )
        )
        settingsData.truncate()

if __name__ == "__main__":
    update_port_info(sys.argv[1])
