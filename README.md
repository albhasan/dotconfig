# My dotfiles

This directory contains the dotfiles for my system.



## Requirements

Ensure you have the following installed on your system

### Git
```
$ apt install git
```

### Stow
```
$ apt install stow
```



## Instalation

First, check out the dotfiles repo in you $HOME directory using git:
```
$ git clone git@github.com/albhasan/dotconfig.git
```

Then, change to the cloned directory and use GNU stow to create symlinks:
```
$ stow -t /home/alber .
```



## References

- "Stow has forever changed the way I manage my dotfiles" by "Dreams of 
Autonomy" in i[youtube](https://youtu.be/y6XCebnB9gs?si=A-jaTzAPCM_Ta_e2)
