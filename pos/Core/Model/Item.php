<?php

namespace Core\Model;

use Core\Base\Model;

class Item extends Model
{
    public function avaliable_items(): array
    {
        // declear variable type array to put all data in specific table inside it
        $data = array();

        // make connection and select all data in specific table
        $result = $this->connection->query("SELECT * FROM $this->table WHERE quantity >0");

        // if num rows of result more than 0 that mean there is data collected from database
        if ($result->num_rows > 0) {

            // we will make loop over all rows to fetch data 
            while ($row = $result->fetch_object()) {

                //put the data in the previous  array 
                $data[] = $row;
            }
        }
        return $data;
    }
}
