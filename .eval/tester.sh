#!/bin/bash

if [ -d $1/$7 ]
then
  user_score=0
  user_score=`expr $user_score + 1`
  [ -f $1/$2 ] && user_score=`expr $user_score + 1`
  [ -f $1/$3 ] && user_score=`expr $user_score + 1`
  if [ $user_score -eq 3 ]
  then
    echo 'Preliminary local directory checks in local repository... Pass'
  else
    echo 'Preliminary local directory checks in local repository... Fail'
  fi
  cd $1
  [ `eval git branch -r | wc -l` -eq 1 ] && echo 'Branch check... Pass' || echo 'Branch check... Fail'
  git checkout master > /dev/null 2>&1
  [ `eval git log --pretty="oneline" | wc -l` -eq 9 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
  cd ..

  if [ -d $4/$5 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    cd $4
    git clone $5 $6 > /dev/null 2>&1
    [ -f $6/$2 ] && user_score=`expr $user_score + 1`
    [ -f $6/$3 ] && user_score=`expr $user_score + 1`
    if [ $user_score -eq 3 ]
    then
      echo 'Preliminary remote directory checks in local repository... Pass'
    else
      echo 'Preliminary remote directory checks in local repository... Fail'
    fi
    cd $6
    [ `eval git branch -r | wc -l` -ge 1 ] && echo 'Branch check... Pass' || echo 'Branch check... Fail'
    git checkout master > /dev/null 2>&1
    [ `eval git log --pretty="oneline" | wc -l` -eq 9 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    cd ../..
    rm -rf $4/$6
  else
    echo 'No remote directory found...'
  fi
else
  echo 'No git found in the local directory'
fi
