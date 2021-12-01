[{block name="dd_widget_header_categorylist"}]
    [{if $oxcmp_categories}]
        [{assign var="homeSelected" value="false"}]
        [{if $oViewConf->getTopActionClassName() == 'start'}]
            [{assign var="homeSelected" value="true"}]
        [{/if}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]
        [{assign var="showNavHoriz" value=$oViewConf->getViewThemeParam('sw_showNavHoriz')}]
        <div class="offcanvas offcanvas-start" id="demo">
            <div class="offcanvas-header">
                <h1 class="offcanvas-title">Heading</h1>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <nav id="navbar_main" class="mobile-offcanvas nav nav--main [{if $showNavHoriz}]nav--horizontal [{else}]nav--vertical[{/if}] nav--mobile col-12 block" role="navigation">

                    <div class="offcanvas-header">
                        <button class="nav-toggler__button btn btn-danger btn-close float-right d-lg-none"> &times Close </button>
                        [{if $showNavHoriz != 'true'}]
                            <h3 class="d-lg-none py-2">[{oxmultilang ident="CATEGORIES"}]</h3>
                        [{/if}]
                    </div>

                    [{block name="dd_widget_header_categorylist_navbar"}]
                        <ul class="level_1">
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

                                        <li class="nav-item[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}][{if $ocat->getSubCats()}] submenu[{/if}]">
                                            <a href="[{$ocat->getLink()}]"class="nav-link[{if $ocat->getSubCats()}] submenu[{/if}]">
                                                [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}] <i class="fa fa-angle-down"></i>[{/if}]
                                            </a>

                                            [{if $ocat->getSubCats()}]
                                                <ul class="level_2">
                                                    [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                                        [{if $osubcat->getIsVisible()}]
                                                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                                [{block name="cmsmenu_dropdown"}] <!-- insert block opening tag before <li> -->
                                                                    <li class="nav-item">
                                                                        <a class="nav-link[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] active[{/if}]" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                                                    </li>
                                                                [{/block}]<!-- insert block closing tag after </li> -->
                                                            [{/foreach}]

                                                            [{if $osubcat->getIsVisible()}]
                                                                <li class="[{if $homeSelected == 'false' && $osubcat->expanded}] active[{/if}]">
                                                                    <a class="[{if $homeSelected == 'false' && $osubcat->expanded}] current[{/if}]" href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a>
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
                        </ul>



                        [{if $oView->isDemoShop()}]

                            <a href="[{$oViewConf->getBaseDir()}]admin/" class="btn btn-sm btn-danger navbar-btn navbar-right visible-lg">
                                [{oxmultilang ident="DD_DEMO_ADMIN_TOOL"}]
                                <i class="fa fa-external-link" style="font-size: 80%;"></i>
                            </a>

                        [{/if}]


                    [{/block}]

                </nav>

            </div>
        </div>
        <!-- Button to open the offcanvas sidebar -->
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
            Menü
        </button>
    [{/if}]
[{/block}]