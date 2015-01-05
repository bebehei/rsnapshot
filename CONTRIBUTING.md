# Developer Notes

This file is intended for developers and packagers of rsnapshot,
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

### release-model in practice
Here is a model presented for release 1.4.0. Make sure, that you start
on the master-branch and have a clean working-directory!

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
