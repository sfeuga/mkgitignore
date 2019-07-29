#!/usr/bin/env bash

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

_mkGitignore_completions() {
  local keyword_list options cur prev
  _init_completion -s || return

  options='--keywords --default --display-default --list --help --version'

  case "$prev" in
    --keywords | -k )
      local prefix=; [[ $cur == *,* ]] && prefix="${cur%,*},"
      keyword_list="$(mkgitignore --list | tr ',' ' ')"
      mapfile -t COMPREPLY < <(compgen -W "$keyword_list" -- "${cur##*,}")
      [[ ${#COMPREPLY[@]} -eq 1 ]] && COMPREPLY=( "${COMPREPLY/#/$prefix}" )
      return
      ;;
    * )
      mapfile -t COMPREPLY < <(compgen -W "$options" -- "${COMP_WORDS[-1]}")
      return
      ;;
  esac
}

complete -F _mkGitignore_completions mkgitignore