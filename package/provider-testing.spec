#
# spec file for package provider-testing (Version 0.0.1)
#
# Copyright (c) 2013 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#

# norootforbuild

Name:           provider-testing
Url:            http://en.opensuse.org/Software_Management/CIM
License:        LGPL-2.1
Group:          Development/Tools/Other
AutoReqProv:    on
Version:        0.0.1
Release:        2
Summary:        CIM provider test framework
Source0:        %{name}-%{version}.tar.bz2
Requires:       cmpi-bindings-ruby
Requires:       sblim-sfcb
PreReq:         cmpi-provider-register
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
A Ruby framework for automated CIM provider testing


%prep
%setup -n %{name}

%build

%install
make install DESTDIR=%{buildroot}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)

%changelog
