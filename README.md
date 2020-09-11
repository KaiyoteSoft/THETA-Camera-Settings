# List Camera Options Using the RICOH THETA SC2 and V

This app uses the RICOH THETA API to display all available camera options to the screen.
It also allows the user to change certain camera settings.

## (Work in Progress)
![screenshot of settings](images/app_home.JPG)

## Overview
On app startup the program displays all available camera settings to the screen. This is accomplished with the `camera.getOptions` command from the RICOH THETA API.

Unfortunately, some settings are only supported for the RICOH THETA V, some are only supported for the THETA SC2 and some settings don't work on either camera :(
See the table below for an overview of which commands are supported by camera model.

### The TABLE

SC2 and V | THETA V (only) | THETA SC2 (only) | Neither
 --------- | -------------- | ---------------- | ----------
'_autoBracket' |  '_authentication',  |  _function'    | _bluetoothClassicEnable
'_bitrate'   |  '_language',  |   _wlanChannel   |  _bluetoothPower
'captureInterval'  |  '_microphone',  |      |  _compositeShootingTime
    'captureMode'  |  '_microphoneChannel'  |   n/a   |  _HDMIreso
    'captureNumber'  |  '_networkType'  |   n/a   |  _imageStitching
    'clientVersion' |   '_shootingMethod'  |   n/a   |  _visibilityReduction
    '_colorTemperature' |   '_timeShift'  |    n/a  | n/a
    'dateTimeZone' |   '_topBottomCorrection'  |  n/a    | n/a
    'exposureCompensation' |   'videoStitching'  |   n/a   | n/a
    'exposureDelay' |   '_wlanFrequency'  |   n/a   | n/a
    'exposureProgram' |  n/a  |   n/a   | n/a
    'fileFormat' |  n/a  |   n/a   | n/a
    '_filter' |  n/a  |   n/a   | n/a
    '_gain' |  n/a  |   n/a   | n/a
    'gpsInfo' |  n/a  |   n/a   | n/a
    'iso' |  n/a  |   n/a   | n/a
    'isoAutoHighLimit' |  n/a  |   n/a   | n/a
    '_latestEnabledExposureDelayTime' |  n/a  |   n/a   | n/a
    '_maxRecordableTime' |  n/a  |   n/a   | n/a
    'offDelay' |  n/a  |   n/a   | n/a
    'previewFormat' |  n/a  |   n/a   | n/a
    'remainingPictures' |  n/a  |   n/a   | n/a
    'remainingSpace' |  n/a  |   n/a   | n/a
    'remainingVideoSeconds' |  n/a  |   n/a   | n/a
    'shutterSpeed' |  n/a  |   n/a   | n/a
    '_shutterVolume' |  n/a  |   n/a   | n/a
    'sleepDelay' |  n/a  |   n/a   | n/a
    'totalSpace' |  n/a  |   n/a   | n/a
    'whiteBalance' |  n/a  |   n/a   | n/a


## The Code
I used the `info` command to retrieve the model of the camera. I then appended appended THETA V or THETA SC2 commands to the list of camera commands **based on the model number.** This keeps the app from breaking across multiple cameras.
```
if (cameraModel == 'RICOH THETA SC2') {
    optionNames.addAll(['_function',
      '_wlanChannel',
    ]);
  }
```
As a reminder, the relevant files can be found in the `lib` folder of this project. 


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
