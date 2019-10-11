# OmniWalletMobile_V2
**ALL NEW EDITION**
Native Mobile wallet for OmniLayer assets, released on Android and iOS.

# What is OmniWalletMobile

OmniWalletMobile is a new type of mobile wallet, which currently supports Bitcoin and all OmniProtocol created tokens, providing Bitcoin&Omnilayer users with a ease-of-use and unrivaled blend of security. The trustless security mechanism it uses has been applied to multiple successful business solutions by LunarX team in the past years. 

The wallet is completely open source, which includes a set of standard backend services, written in java/golang, and a mobile side app written in Dart(Flutter framework initiated by Google).


# Clone the repo
```
git clone https://github.com/LightningOnOmnilayer/OmniWalletMobile_V2.git
cd LightningOnOmnilayer/OmniWalletMobile_V2
```

# Security Assessment
Server attacked 

>The user ID, ie the mnemonic code, and the PIN code are stored in MD5, then hackers can only get encrypted text. The only information in plain text the the wallet addresses, which are meant to be known in using a wallet funtions.

Server crashed, data loss

>Use mnemonic code to restore accounts at any other wallet supporting omni protocol. User's asset will not be loss.

Mobile phone lost(local data compromised)

>mnemonic code and PIN code are stored in MD5, if screen of the device is locked, user's data is safe, hence his assets. In addition, single logon mechanism makes sure that if a user logon on his another device and change the pin code as soon as he find one lost, the missing device will be locked immediatly and will never be unlocked.

mnemonic code backed up in plain text stolen

>*Important*: there is no way in the world to protect your assets if your mnemonic code is known to others. Anyone including yourself can restore your account using the code on any other third party wallets. So write down the code on a paper, and lock the paper at a safe place, which is known to yourself only. 