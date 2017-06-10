require "resources/mysql-async/lib/MySQL"

RegisterServerEvent("jobs:getJobs")
AddEventHandler("jobs:getJobs", function ()
    MySQL.Async.fetchAll("SELECT price, i1.`id` AS raw_id, i1.`libelle` AS raw_item, i2.`id` AS treat_id, i2.`libelle` AS treat_item, p1.x AS fx, p1.y AS fy, p1.z AS fz, p2.x AS tx, p2.y AS ty, p2.z AS tz, p3.x AS sx, p3.y AS sy, p3.z AS sz FROM recolt LEFT JOIN items i1 ON recolt.`raw_id`=i1.id LEFT JOIN items i2 ON recolt.`treated_id`=i2.id LEFT JOIN coordinates p1 ON recolt.`field_id`=p1.id LEFT JOIN coordinates p2 ON recolt.`treatment_id`=p2.id LEFT JOIN coordinates p3 ON recolt.`seller_id`=p3.id",
    function(result)
        if (result) then
            TriggerClientEvent("cli:getJobs", source, result)
        end
    end)
end)