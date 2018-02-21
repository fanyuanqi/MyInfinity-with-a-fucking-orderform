{foreach $navbar as $item}
    <li menuItemName="{$item->getName()}" class="nav-item parent {if $item->hasChildren()}nav-sub{/if}{if $item->getClass()} {$item->getClass()}{/if}" id="{$item->getId()}">
        <a class="nav-link" href="{$item->getUri()}"{if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>{/if}
            {$item->getLabel()}
            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
        </a>
        {if $item->hasChildren()}
            <ul class="mai-nav-tabs-sub mai-sub-nav nav">
            {foreach $item->getChildren() as $childItem}
                <li menuItemName="{$childItem->getName()}" class="nav-item {if $childItem->getClass()}{$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                    <a class="nav-link" href="{$childItem->getUri()}"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>{/if}
                        <span class="name">{$childItem->getLabel()}</span>
                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                    </a>
                </li>
            {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
