[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]
[{block name="sidebar"}]
    [{block name="sidebar_categoriestree"}]
		<div class="categorytree">
            [{block name="sw_togglemenu_icon"}]
                [{*Button Mobile Menü*}]
                [{include file="layout/inc/toggle_button.tpl"}]
            [{/block}]
            [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
		</div>
    [{/block}]
[{/block}]