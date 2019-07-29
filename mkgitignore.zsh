#compdef mkgitignore

# Copyright (C) 2019 Stephane FEUGA OSHIMA
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# Written by Stephane FEUGA OSHIMA <sfeuga@member.fsf.org>

_mkgitignore() {
  local -a args

  args+=(
    {-d,--default}'[Create a default .gitignore]'
    --display-default'[Display default values]'
    --help'[Display help]'
    {-k,--keywords}'[Create a .gitignore via keywords]: :->kw'
    --list'[Display full list off keywords]'
    --upgrade'[Upgrade to latest version]'
    --version'[Display version]'
  )

  _arguments -C $args

  case "$state" in
    kw )
      _values -s , 'keywords' "${(uonzf)$(mkgitignore --list | tr ',' ' ')}"
      ;;
  esac
}

_mkgitignore "$@"
