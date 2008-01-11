local cosmo = require "template.cosmo"

template = [==[ 
<h1>$list_name</h1>
<ul>
 $do_items[=[<li>$item</li>]=]
</ul>
]==]

print(cosmo.fill(template,
           { list_name = "My List",
             do_items  = function()
                for i=1,5 do
                   cosmo.yield { item = i }
                end
             end
           }
          ))

warn_about_alligators = true

print(cosmo.fill ( "-- $if_warning[=[<b>Beware of $warning!<b>]=] --",
             { if_warning = cosmo.cond(warn_about_alligators,
                                       { warning = "ALLIGATORS" }
                                      )
             }
           ))

warn_about_alligators = false

print(cosmo.fill ( "-- $if_warning[=[<b>Beware of $warning!<b>]=] --",
             { if_warning = cosmo.cond(warn_about_alligators,
                                       { warning = "ALLIGATORS" }
                                      )
             }
           ))


