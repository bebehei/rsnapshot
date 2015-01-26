# Developer Notes

This file is intended for developers and packagers of rsnapshot,
<<<<<<< HEAD
not for regular users. If you want to contribute, it's a
good idea to read this document. Altough the file is called contributing, it
describes the whole release and development process.

## Bug tracker

The bug tracker is hosted on [Github](https://github.com/DrHyde/rsnapshot/issues). Please don't report any issues in the tracker on Sourceforge.

## Source code control

The rsnapshot source code is on [Github](https://github.com/DrHyde/rsnapshot).

Auto-generated files should not get tracked. If you need the configure-script, generate it with `./autogen.sh`. Keep in mind, that you have to execute `./autoclean.sh` before you commit.

## Opening Issues

If you have found a bug, open an issue-report on Github. Before you open a report, please search if there are corresponding issues already opened or the `master`-branch has it fixed. Please provide the rsnapshot-version, and describe how to reproduce the bug. It would be great, if you can provide also a fix.

## Building rsnapshot 

rsnapshot uses the common triple to build software:

    $ ./configure
    $ make
    $ make install

If you checked rsnapshot out of the git-repository, you have to generate the configure-script with:

    $ ./autogen.sh

## Development
The `master` branch should be complete, by which we mean that there should be no half-completed features in it. Any development-work should be done in a branch. Those single branches should have only a single feature or bugfix in it. 

### Adding features

Fork the repository and open a new branch prefixed with `feature/`. Keep the name short and descriptive. Before opening a Pull-Request against the main repository, make sure that:

    * you have written tests, which test the functionality
    * all the tests pass
    * your commits are logically ordered
    * your commits are clean

If it is not the case, please rebase/revise your branch. After reviewing your changes by a team-member, they can get merged into master.

### Fixing Bugs

Create a new branch, prefix it with `issue/` and - if available - the github issue number. (e.g. `issue/35-umount-lvm`).

Add your commits to the branch. They should be logically ordered and clean. Rebase them, if neccessary. Make sure that `make tests` passes. After finishing, open a pull-request and the code is taken for review.

After a project-member verified your changes they can get merged in. The project-member should go on now, merge the branch also in the current release-branches and release new bugfix-versions.

## Releases and versions
### release-branches

Releases should be done from branches, named for the release version,
e.g. release-1.4. The first release of that version should be tagged `1.4.0`.
Subsequent releases of that version, which should contain no changes other
than bugfixes and security fixes, should also be tagged as, eg, `1.4.1`.

//unsure, depends on further development
Depending on the activity of rsnapshot, for every merged bugfix-branch, a bugfix-release should be done.

At the end, we have 3 types of branches: feature-branches and bugfix-branches; master, where every finished branch gets merged in 
=======
not for regular users of rsnapshot. If you want to contribute, it's a
good idea to read this document

## Bug tracker

The bug tracker is hosted on [Github](https://github.com/DrHyde/rsnapshot/issues).

The bug tracker and mailing lists are on [Sourceforge](https://sourceforge.net/projects/rsnapshot/).

## Source code control

The rsnapshot source code lives also on [Github](https://github.com/DrHyde/rsnapshot).

The 'master' branch should be complete, by which we mean that there should
be no half-completed features in it.  This means that anything which
requires more than one commit should be done in a branch.

Trivial changes (such as correcting spalling mistooks, or which change
just one or two lines of code) can go straight into master.  Non-trivial
changes should be reviewed by another developer, by raising a github
"pull request".

## Releases and versions

Releases should be done from branches, named for the release version,
eg release-1.4.  The first release of that version should be tagged '1.4.0'.
Subsequent releases of that version, which should contain no changes other
than bugfixes and security fixes, should also be tagged as, eg, '1.4.1'.

>>>>>>> 4103ab7b17cdee7b1854c5fcb4f4fe1c7f0d4875
### release-model in practice
Here is a model presented for release 1.4.0. Make sure, that you start
on the master-branch and have a clean working-directory!

<<<<<<< HEAD
1.  You start branching out of the master-branch

    git checkout -b release-1-4

2.  If there are necessary changes to do before release, make them and commit them now.

    git add -A
    git commit -m "Finish Release v1.4.0"

3.  tag the commit with git and push it to repo

    git tag 1.4.0
    git push --tags
 
4.  Now generate the configure-file with autogen.sh and make the release-tarball

    ./autogen.sh
    make dist

5.  Now upload the tarball to the github-page for the specific version.


### make targets

* *make man*: generate the man page from POD data in rsnapshot
* *make html*: generate a HTML page from POD data in rsnapshot
* *make doc*: man + html
* *make test*: run the testsuite
* *make clean*: clean up the mess from autoconf
* *make dist*: make the release-tarball
=======
1. You start branching out of the master-branch

		git checkout -b release-1.4

2. Now generate the configure-file with autogen.sh

		./autogen.sh

3. Add the changes to staging area and commit

		git add -A
		git commit -m "setup release v1.4.0"

4. tag the commit with git

		git tag v1.4.0

5. Push the release to GitHub repo

		git push --tags

## Building rsnapshot 

rsnapshot uses the common and widespread triple to build the software
  
	./configure
	make
	make install

### make targets

* make man: generate the man page from POD data in rsnapshot
* make html: generate a HTML page from POD data in rsnapshot
* make doc: man + html
* make test: run the testsuite
* make clean: clean up the mess from autoconf
* make rpm:

To create the RPM (on a RedHat compatible system, I usually used
CentOS). beware, RPMs are not necessarily compatible between distros!
rsnapshot is simple enough that the RPMs seem to work everywhere
(partly thanks to a bug reported by a SuSE user where needless RPM
dependencies were being introduced). If all goes well, you should end
up with an RPM in your working directory. see the rpm Makefile target
for details on the commands.

	tar xzvf rsnapshot-x.y.z.tar.gz
	cd rsnapshot-x.y.z
	./configure
	make rpm
	or
	make RPM_BASE_DIR=/path/to/rpmbuild rpm
>>>>>>> 4103ab7b17cdee7b1854c5fcb4f4fe1c7f0d4875
