# HOW TO CONTRIBUTE

If you want to contribute to the project follow 3-step process:
* Fork the repository.
* Implement feature, improvement or make the fix.
* Submit a pull request to the project owner.


### 1. Fork the repository

1.1 Fork repository to create a copy of the repository in your own GitHub account. 

* Go to https://github.com/Juju4ka/UpgradeBelt-iOS
* In the top-right corner of the page, click **Fork**.

1.2 Set up a working copy on your computer

* Clone locally using terminal 
`$ git clone https://github.com/Juju4ka/UpgradeBelt-iOS.git`

* Change into the new project’s directory 
`$ cd UpgradeBelt-iOS`

* Set up a new remote that points to the original project so that you can grab any changes and bring them into your local copy
`$ git remote add upstream https://github.com/Juju4ka/UpgradeBelt-iOS.git`
<br/>

You now have two remotes for this project on disk:

1. *origin* which points to your GitHub fork of the project (i.e. https://github.com/<your_nickname>/UpgradeBelt-iOS). You can read and write to this remote.
2. *upstream* which points to the main project’s GitHub repository (i.e. https://github.com/Juju4ka/UpgradeBelt-iOS). You can only read from this remote.

### 2. Implement feature, improvement or make the fix

2.1 Get the source code working on your computer. Use *README.md* for more details. <br/>
2.2 Create your own branch and do some work. <br/>
* If you are bug fixing, then branch from **master**
* If you are adding a new feature or improvement then branch from **develop**
* Prefix your own branch with “hotfix/” or “feature/” and give a meaningful name. For example, *hotfix/readme-update*
* Run Unit Tests to ensure that you haven't broken anything.
* You may also add a new test to show that your change fixes the original problem.
* **Ensure that you only fix the thing you’re working on. Do not be tempted to fix some other things that you see along the way, including formatting issues, as your PR will probably be rejected.**
* Make sure that you commit in logical blocks. Each commit message should be sane. Read Tim Pope’s [A Note About Git Commit Messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

<br/>

### 3. Submit a pull request to the project owner

To create a Pull Request (PR).
* push your branch to the origin remote:
`$ git push -u origin hotfix/readme-update`
* Swap back to the browser and navigate to your fork of the project (https://github.com/<your_nickname>/UpgradeBelt-iOS).
* You’ll see that your new branch is listed at the top with a handy “Compare & pull request” button. Press that button.
* Provide a good, succinct title for your pull request and explain why you have created it in the description box.

You are done!

<br/>
This document was created with a help of <a href="http://tiny.cc/j1kumz">A guide to contributing to a GitHub project</a>
