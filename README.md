# runcom

Login shells start at `~/.bash_profile`, which sources `~/.bashrc`. `bashrc` sources `/etc/bashrc`, then each user file that exists and is readable, in this order:

```text
~/.bash_profile
└── ~/.bashrc
    ├── /etc/bashrc
    ├── ~/.aliases
    ├── ~/.functions
    ├── ~/.path
    ├── ~/.dockerfunc
    ├── ~/.kubefunc
    ├── ~/.exports
    └── ~/.additions     optional, local only
```
