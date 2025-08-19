# 42 vogsphere Advanced config 

## First init for pisciners and retryers
in Piscine / Shell00 / exercice, you need to create an ssh connection to vogsphere, here we see how to create it easily and both connection with your personal git (github). 
the dual connection is not necessary but its fun to do this for improve your skills and create memories.

# create a .ssh key for your 42 student session
42 profile authorize 3 ssh keys connection.
actually just one is necessary but for secure reason we create a ssh key for external machine from 42

## GIT CONFIG EXPRESS 
`git remote -v`

`git remote add [github] https://github.com/[USER]/[repo].git`

note master:main is a trick to sync the branch vogsphere/master to github/main. if you want to clean your repo, choice a vintage master name.
`git push origin master && git push github master:main`

## .gitconfig to build a perfect ci/cd 42/personal repo
underconstruction for pisciners, retryers and students
