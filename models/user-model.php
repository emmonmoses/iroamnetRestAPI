<?php

/*
    Author:- Emmon Moses
    Date:- 2020-12-30
    Purpose:- User Class to manage actions: Login and SignUp with user details.
*/

class User{ 
    // database connection and table name
    private $con;
    private $table_name = "users";
 
    // object properties
    public $id;
    public $name;
    public $email;
    public $password;
   
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->con = $db;
    }

    //user signup method
    function signup(){
    
        if($this->isAlreadyExist()){
            return false;
        }
        // query to insert record of new user signup
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                name=:name, email=:email, password=:password";

        // prepare query
        $stmt = $this->con->prepare($query);    
        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->password=htmlspecialchars(strip_tags($this->password));  
    
        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":password", $this->password);        
    
        // execute query
        if($stmt->execute()){
            $this->id = $this->con->lastInsertId();
            return true;
        }    
        return false;        
    }

    // login user method
    function login(){
        // select all query with user inputed email and password
        $query = "SELECT
                    `id`, `email`, `password`, `name`
                FROM
                    " . $this->table_name . " 
                WHERE
                    email='".$this->email."' AND password='".$this->password."'";
        // prepare query statement
        $stmt = $this->con->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }

    // Notify if User with given email Already exists during SignUp
    function isAlreadyExist(){
        $query = "SELECT *
            FROM
                " . $this->table_name . " 
            WHERE
                email='".$this->email."'";
        // prepare query statement
        $stmt = $this->con->prepare($query);
        // execute query
        $stmt->execute();
        if($stmt->rowCount() > 0){
            return true;
        }
        else{
            return false;
        }
    }
}