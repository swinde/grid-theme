<?php
/**
 * This file is part of OXID eSales Wave theme.
 *
 * OXID eSales Wave theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales Wave theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eSales Wave theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2016
*/
$oTheme = oxNew('oxtheme');
$oTheme->load('wave');
/**
 * Theme Information
 */
$aTheme = array(
    'id'          => 'grid',
    'title'       => 'Grid Theme (Seifenstück)',
    'description' => 'Child Wave Theme is OXID`s official responsive theme based on the CSS framework Bootstrap 4.',
    'thumbnail'   => 'theme.jpg',
    'version'     => '1.1.0',
    'author'      => '<a href="http://winde-ganzig.de" title="Steffen Winde">Steffen Winde</a>',
    'parentTheme' => 'wave',
    'parentVersions' => array($oTheme->getInfo('version'))
);
