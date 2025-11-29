# Changelog
All notable changes to this project will be documented in this file.

## 1.0.4
```diff
+ [Added] more default tools/packages
@@ antlr4 antlr4-doc basex basez bashtop bash-doc bash-completion bash-argsparse basix-doc catdoc ddnet grep nmap tcpdump @@
+ [Added] support for minimal build (only keeps a few packages)
@@ nano sudo build-essential curl p7zip unrar-free mandoc grep @@
```

## 1.0.3
```diff
+ [Added] more default tools/packages
@@ 7kaa p7zip p7zip-full unrar-free mandoc  @@
```

## 1.0.2
```diff
! [Changed] Increased memory limit for building
! [Changed] Decreased default CPU limit for virtualised instances
! [Changed] Decreased default stack size for applications running in instances
+ [Added] `sudo` command to GVisor
+ [Added] `sudo` permissions for `user` user
- [Removed] `sudo` permissions for `anonymous` user
```

## 1.0.1
```diff
+ [Added] CHANGELOG.md
+ [Added] LICENSE.md
@@ LICENSE.md = MIT @@
+ [Added] Commandline arguments
@@ newshell help = details @@
+ [Added] Build details in README.md
! [Changed] Fixed CHANGELOG.md highlighting/formatting
```

## 1.0.0
Initial commit.
