LibShell
========

Usage
-----

FIXME

Installation
------------

```bash
sudo make install
```

This runs tests and installs libshell to `/usr/local/bin`.
If you don't have `shunit2` installed run `sudo make install-only` instead.

Uninstallation
--------------

```bash
sudo make uninstall
```

Testing the library works ok
----------------------------

```bash
make test
```

In order to run tests you need to have [SHUnit2](https://code.google.com/p/shunit2/) to be accessible in PATH.
You can do this by `apt-get install shunit2` on Ubuntu. For other systems check SHunit2's docs.


Contributing
------------

Pull requests are welcome

License
-------

(c) Timur Batyrshin (<erthad@gmail.com>), Apache 2.0 License

See http://www.apache.org/licenses/LICENSE-2.0 for the full License text.
