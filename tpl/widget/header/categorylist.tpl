
[{block name="dd_widget_header_categorylist"}]
    [{if $oxcmp_categories}]
        [{assign var="homeSelected" value="false"}]
        [{if $oViewConf->getTopActionClassName() == 'start'}]
            [{assign var="homeSelected" value="true"}]
        [{/if}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]
        [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
        <nav id="menu" class="nav nav--main nav--horizontal nav--right nav--mobile " role="navigation">
            [{block name="dd_widget_header_categorylist_navbar"}]
                <ul id="navigation" class="level_1">
                        [{block name="dd_widget_header_categorylist_navbar_list"}]
                            [{if $oViewConf->getViewThemeParam('blHomeLink')}]
                                <li class="nav-item[{if $homeSelected == 'true'}] active[{/if}]">
                                    <a class="nav-link" href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a>
                                </li>
                            [{/if}]

                            [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                                [{if $ocat->getIsVisible()}]
                                    [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                        <li class="nav-item">
                                            <a class="nav-link[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] active[{/if}]" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                        </li>
                                    [{/foreach}]

                                    <li class="nav-item[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}][{if $ocat->getSubCats()}] dropdown[{/if}]">
                                        <a class="nav-link" href="[{$ocat->getLink()}]"[{if $ocat->getSubCats()}] class="dropdown-toggle" data-toggle="dropdown"[{/if}]>
                                            [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}] <i class="fa fa-angle-down"></i>[{/if}]
                                        </a>

                                        [{if $ocat->getSubCats()}]
                                            <ul class="level_2">
                                                [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                                    [{if $osubcat->getIsVisible()}]
                                                        [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                            <li class="dropdown-item[{if $oViewConf->getContentId() == $ocont->getId()}] active[{/if}]">
                                                                <a class="dropdown-link[{if $oViewConf->getContentId() == $ocont->getId()}] current[{/if}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                                            </li>
                                                        [{/foreach}]

                                                        [{if $osubcat->getIsVisible()}]
                                                            <li class="dropdown-item[{if $homeSelected == 'false' && $osubcat->expanded}] active[{/if}]">
                                                                <a class="dropdown-link[{if $homeSelected == 'false' && $osubcat->expanded}] current[{/if}]" href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a>
                                                            </li>
                                                        [{/if}]
                                                    [{/if}]
                                                [{/foreach}]
                                            </ul>
                                        [{/if}]
                                    </li>
                                [{/if}]
                            [{/foreach}]
                        [{/block}]
                    [{block name="widget_header_blog_categorylist"}][{/block}]
                    </ul>

                    

                    [{if $oView->isDemoShop()}]

                        <a href="[{$oViewConf->getBaseDir()}]admin/" class="btn btn-sm btn-danger navbar-btn navbar-right visible-lg">
                            [{oxmultilang ident="DD_DEMO_ADMIN_TOOL"}]
                            <i class="fa fa-external-link" style="font-size: 80%;"></i>
                        </a>

                    [{/if}]


            [{/block}]

        </nav>
    [{/if}]
[{/block}]
