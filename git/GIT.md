![Cover](https://github.com/nephcode/42-nephcode/blob/main/.github/images/readmeHeader42.png)

# 42 VOGSPHERE ADVANCED CONFIG 
Here, we see how to create it easily and both connection with your personal git (github). 
the dual connection is not necessary but its fun to do this for improve your skills and create memories.

## FIRST INIT 
in Piscine Session for Shell00 exercice, you need to create an ssh connection to vogsphere *(it is a gitea server)*. 

## CREATE A SSH-KEY 42 EXTERNAL SESSION [SAFE]
42 profile authorize 3 ssh keys connection.
actually just one is necessary but for secure reason we create a ssh key for external machine from 42

## ADD GITHUB CONFIG (MIRROR) 
`git remote -v`

`git remote add [github] https://github.com/[USER]/[repo].git`

note master:main is a trick to sync the branch vogsphere/master to github/main. if you want to clean your repo, choice a vintage master name.
`git push origin master && git push github master:main`

## .gitconfig to build a perfect ci/cd 42/personal repo
underconstruction for pisciners, retryers and students

![Cover](https://github.com/nephcode/42-nephcode/blob/main/.github/images/readmeFooter42.png)
