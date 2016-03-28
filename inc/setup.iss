#ifdef VERSIONFILE
  ; Read the semantic and the installer file version from the VERSION file
  #define FILE_HANDLE FileOpen(VERSIONFILE)
  #define SEMANTIC_VERSION FileRead(FILE_HANDLE)
  #define FOUR_NUMBER_VERSION FileRead(FILE_HANDLE)
  #expr FileClose(FILE_HANDLE)
#pragma message SEMANTIC_VERSION
#else
  #define SEMVER {#LONGVERSION}
#endif

AppId={#APP_GUID}
AppName={#PRODUCT}
VersionInfoProductName={#PRODUCT}
AppVerName={#PRODUCT} {#SEMANTIC_VERSION}
AppPublisher={#COMPANY}
VersionInfoCompany={#COMPANY}
AppCopyright={#PUB_YEARS} {#COMPANY}
VersionInfoCopyright={#PUB_YEARS} {#COMPANY}
VersionInfoDescription=Excel addin.
VersionInfoVersion={#FOUR_NUMBER_VERSION}
VersionInfoProductVersion={#SEMANTIC_VERSION}
VersionInfoTextVersion={#SEMANTIC_VERSION}
AppPublisherURL={#HOMEPAGE}
AppSupportURL={#HOMEPAGE}
AppUpdatesURL={#HOMEPAGE}
OutputDir={#OUTPUTDIR}

AppendDefaultDirName=false
ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64
CloseApplicationsFilter=*.*
CreateAppDir=true
DefaultDialogFontName=Segoe UI
DefaultDirName={code:SuggestInstallDir}
DisableDirPage=false
DisableProgramGroupPage=true
DisableReadyPage=false
LanguageDetectionMethod=locale
SetupLogging=true
TimeStampsInUTC=false
UninstallFilesDir={app}\uninstall
WizardImageBackColor=clWhite
WizardImageStretch=false

; Allow normal users to install the addin into their profile.
; This directive also ensures that the uninstall information is
; stored in the user profile rather than a system folder (which
; would require administrative rights).
PrivilegesRequired=lowest

InternalCompressLevel=max
SolidCompression=true
#ifndef DEBUG
	OutputBaseFilename={#PRODUCT}-{#SEMANTIC_VERSION}
#else
	OutputBaseFilename={#PRODUCT}-debug
#endif

#ifdef LICENSE_FILE
  LicenseFile={#SETUPFILESDIR}{#LICENSE_FILE}
#endif

#ifdef INSTALLER_ICO
  SetupIconFile={#SETUPFILESDIR}{#INSTALLER_ICO}
  UninstallDisplayIcon={#SETUPFILESDIR}{#INSTALLER_ICO}
#endif

#ifdef INSTALLER_IMAGE_LARGE
  WizardImageFile={#SETUPFILESDIR}{#INSTALLER_IMAGE_LARGE}
  WizardImageStretch=false
  WizardImageBackColor=clWhite
#endif

#ifdef INSTALLER_IMAGE_SMALL
  WizardSmallImageFile={#SETUPFILESDIR}{#INSTALLER_IMAGE_SMALL}
#endif

; Checksums for additional runtime files.
#define DOTNETSHA1 "58da3d74db353aad03588cbb5cea8234166d8b99"
#define VSTORSHA1 "ad1dcc5325cb31754105c8c783995649e2208571"

; vim: ts=2 sts=2 sw=2 et