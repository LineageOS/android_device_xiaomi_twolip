#!/bin/bash
#
# Copyright (C) 2018-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

function blob_fixup() {
    case "${1}" in

    # Make shim for libcamera.sdm660.so
    vendor/lib/hw/camera.sdm660.so)
        for  LIBCAMERA_SHIM in $(grep -L "libcamera_sdm660_shim.so" "${2}"); do
            patchelf --add-needed "libcamera_sdm660_shim.so" "$LIBCAMERA_SHIM"
        done
        ;;
    esac
}

set -e

export DEVICE=twolip
export VENDOR=xiaomi
export DEVICE_BRINGUP_YEAR=2019
export DEVICE_COMMON=sdm660-common

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh "$@"
