#-*- coding: utf-8 -*-

# Copyright 2014, pocke
# Licensed MIT
# http://opensource.org/licenses/mit-license.php

Plugin.create(:delete_copy) do
  command(
    :delete_copy,
    name: '削除 & コピー',
    description: 'つい消しをしてコピー。vimのヤンクみたいな!',
    condition: Plugin::Command[:IsMyMessageAll],
    visible: true,
    icon: Skin.get("close.png"),
    role: :timeline
  ) do |opt|
    # TODO: ifが機能していない(必ずヤンクされる)
    if Plugin.filtering(:command, {}).first[:delete][:exec].call(opt) then
      Plugin.filtering(:command, {}).first[:copy_description][:exec].call(opt)
    end
  end
end
