<?php

namespace Core\Controller;

use Core\Base\Controller;
use Core\Helpers\Helper;
use Core\Model\Transaction;
use Core\Model\User;
use Core\Model\Item;
use Core\Helpers\Tests;

class Admin extends Controller
{
        use Tests;
        /**
        * make instance of class view
        *
        * @return void
        */
        public function render()
        {
                if (!empty($this->view))
                        $this->view();
        }
        /**
        * check if user login or not and if admin will show him specific view
        *
        * @return void
        */

        function __construct()
        {
                $this->auth();
                $this->admin_view(true);
        }
        /**
        * get profits of 5 days and total sales for all transaction and total transaction number ,all item number total users
        * top five expensive items to buy and number of last 5 days indiviually
        *
        * @return array
        */

        public function index()
        {
               
                $this->permissions(['user:read']);

                // display dashboard html script
                $this->view = 'dashboard';

                // make instance from transaction class which will connect with data base
                $transaction = new Transaction;

                // make summation of total sales column from table transactions in database
                $total =$transaction->sum("total","transactions");

                //we checked if total if empty or not
                self::check_if_empty($total);

                // make total float with 2 decimal after dote
                $this->data['total']=number_format((float)$total[0], 2, '.', '');

                // find all transactions number
                $this->data['total_transactions']= count($transaction->get_all());

                // find summation fo expenses ( all cost) to calculate profites
                $expenses =$transaction->sum("expenses","transactions");
                $this->data['expenses']=number_format((float)$expenses[0], 2, '.', '');

                // calculate the profites
                $this->data['profite']=($this->data['total'])-($this->data['expenses']);
                


                // now data related with user first we make instance of user class to call with db
                $user = new User;
                self::check_if_empty($user->get_all());

                // get all user number
                $this->data['total_users']= count($user->get_all());

                // now data related with items with making instance of item
                $item = new Item;
                self::check_if_empty($item->get_all());

                // get all items number
                $this->data['total_items']= count($item->get_all());

                // here we calculate total procurement 
                $procurement =$transaction->sum("total_procurement","items");
                $this->data['procurement']=number_format((float)$procurement[0], 2, '.', '');
               
                // here we find top five item expensive to by by using function in model
                $top=$item->top("selling_price","items",5);
                self::check_if_empty($top);
                $this->data['top_five']=$top;
 ///////////////////////////////////////////////////////////////////////////////////////////////////             
                // now i want to find number of transaction in current day 
                $transactions1=array();
                $sql ="SELECT *FROM transactions WHERE  created_at >= CURDATE()";
                $transaction_query_conditions=$transaction->connection->query($sql);
                if($transaction_query_conditions->num_rows>0){
                        while($row= $transaction_query_conditions->fetch_object()){
                                $transactions1[]=$row;    
                        }
                }
                $this->data['curent_day']=count($transactions1);
                
                // now i want to find number of transaction in priveous day 
                $transactions2=array();
                $sql ="SELECT *FROM transactions WHERE  created_at >= CURDATE()-1";
                $transaction_query_conditions=$transaction->connection->query($sql);
                if($transaction_query_conditions->num_rows>0){
                        while($row= $transaction_query_conditions->fetch_object()){
                                $transactions2[]=$row;    
                        }
                }
                $this->data['curent_day_2']=count($transactions2)-$this->data['curent_day'];
                
                
                // now i want to find number of transaction in before three days
                $transactions3=array();
                $sql ="SELECT *FROM transactions WHERE  created_at >= CURDATE()-2";
                $transaction_query_conditions=$transaction->connection->query($sql);
                if($transaction_query_conditions->num_rows>0){
                        while($row= $transaction_query_conditions->fetch_object()){
                                $transactions3[]=$row;    
                        }
                }
                $this->data['curent_day_3']=count($transactions3)-($this->data['curent_day_2']+$this->data['curent_day']);
                
                // now i want to find number of transaction in before four days
                $transactions4=array(); 
                $sql ="SELECT *FROM transactions WHERE  created_at >= CURDATE()-3";
                $transaction_query_conditions=$transaction->connection->query($sql);
                if($transaction_query_conditions->num_rows>0){
                        while($row= $transaction_query_conditions->fetch_object()){
                                $transactions4[]=$row;    
                        }
                }
                $this->data['curent_day_4']=count($transactions4)-($this->data['curent_day_3']+$this->data['curent_day_2']+$this->data['curent_day']);
                

                // now i want to find number of transaction in before five days
                $transactions5=array();
                $sql ="SELECT *FROM transactions WHERE  created_at >= CURDATE()-4";
                $transaction_query_conditions=$transaction->connection->query($sql);
                if($transaction_query_conditions->num_rows>0){
                        while($row= $transaction_query_conditions->fetch_object()){
                                $transactions5[]=$row;    
                        }
                }
                $this->data['curent_day_5']=count($transactions5)-($this->data['curent_day_4']+$this->data['curent_day_3']+$this->data['curent_day_2']+$this->data['curent_day']);
                
                // i make array of collected data to use it in api
                $this->data['num_transactions']=[
                        $this->data['curent_day'],
                        $this->data['curent_day_2'],
                        $this->data['curent_day_3'],
                        $this->data['curent_day_4'],
                        $this->data['curent_day_5']
                ];
                // i make array of days to use it in chart in api
                $this->data['days']=[
                        date('d-m-y'),
                        date('d-m-y', time() - 60 * 60 * 24),
                        date('d-m-y', time() - 172800),
                        date('d-m-y', time() - 259200),
                        date('d-m-y', time() - 345600)
                ];
                

                
  // now i need to find the profits for each days by finding total and expenses for each day               

////////////////////////////////// profit for current day //////////////////////////////////////////////////
               $total1= $transaction->sum_total("total","transactions","0");
               $total_t1=number_format((float)$total1[0], 2, '.', '');
               
               $expenses_1= $transaction->sum_total("expenses","transactions","0");
               $expenses_t1=number_format((float)$expenses_1[0], 2, '.', '');
              
               $profit_current_day=$total_t1-$expenses_t1;
               $profit_current_day=number_format((float)$profit_current_day, 2, '.', '');
               $this->data['cur_day']=$profit_current_day;
               
////////////////////////////////// the day before current day //////////////////////////////////////////////////////////////////
               $total_2= $transaction->sum_total("total","transactions",(int)"1");
               $total_t2=number_format((float)$total_2[0], 2, '.', '');

               $expenses_2= $transaction->sum_total("expenses","transactions",(int)"1");
               $expenses_t2=number_format((float)$expenses_2[0], 2, '.', '');

               $profit_2_day=$total_t2-$expenses_t2;
               $profit_2_day=number_format((float)$profit_2_day, 2, '.', '');
               $this->data['day_2']=$profit_2_day-$this->data['cur_day'];
               
///////////////////////////////////////the day before 2 days /////////////////////////////////////////////////////////
               $total_3= $transaction->sum_total("total","transactions","2");
               $total_t3=number_format((float)$total_3[0], 2, '.', '');

               $expenses_3= $transaction->sum_total("expenses","transactions","2");
               $expenses_t3=number_format((float)$expenses_3[0], 2, '.', '');

               $profit_3_day=$total_t3-$expenses_t3;
               $profit_3_day=number_format((float)$profit_3_day, 2, '.', '');
               $this->data['day_3']=$profit_3_day-($this->data['day_2']+$this->data['cur_day']);
               
//////////////////////////////////////////the day before 3 days//////////////////////////////////////////////////////////////////
               $total_4= $transaction->sum_total("total","transactions","3");
               $total_t4=number_format((float)$total_4[0], 2, '.', '');

               $expenses_4= $transaction->sum_total("expenses","transactions","3");
               $expenses_t4=number_format((float)$expenses_4[0], 2, '.', '');

               $profit_4_day=$total_t4-$expenses_t4;
               $profit_4_day=number_format((float)$profit_4_day, 2, '.', '');
               $this->data['day_4']=$profit_4_day-($this->data['day_3']+$this->data['day_2']+$this->data['cur_day']);
               
/////////////////////////////////////////the day before 4 days///////////////////////////////////////////////////////
               $total_5= $transaction->sum_total("total","transactions","4");
               $total_t5=number_format((float)$total_5[0], 2, '.', '');

               $expenses_5= $transaction->sum_total("expenses","transactions","4");
               $expenses_t5=number_format((float)$expenses_5[0], 2, '.', '');

               $profit_5_day=$total_t5-$expenses_t5;
               $profit_5_day=number_format((float)$profit_5_day, 2, '.', '');
               $this->data['day_5']=$profit_5_day-($this->data['day_4']+$this->data['day_3']+$this->data['day_2']+$this->data['cur_day']);
              
               
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
             // this array to use it in chart in api
               $this->data['profits_5']=[
                       $this->data['cur_day'],
                       $this->data['day_2'],
                       $this->data['day_3'],
                       $this->data['day_4'],
                       $this->data['day_5']
                       
               ];

}

}