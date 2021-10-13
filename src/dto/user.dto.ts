import { IsNumber, IsString, IsDate } from 'class-validator';


export class user {
    @IsNumber()
    id

    @IsString()
    login_id	

    @IsString()
    first_name	

    @IsString()
    middle_name	

    @IsString()
    last_name	

    @IsNumber()
    gender

    @IsDate()
    date_of_created	

    @IsDate()
    date_of_updated	

    @IsNumber()
    status	

    @IsDate()
    birthday

    @IsString()
    password	
    
    @IsNumber()
    auth_type_id
    
    @IsNumber()
    reword	
}

export class Client {
    @IsNumber()
    id

    @IsString()
    login_id	

    @IsString()
    name

    @IsString()
    description	

    @IsDate()
    date_of_created	

    @IsDate()
    date_of_updated

    @IsString()
    password
    
    @IsNumber()
    auth_type_id
    
}

export class Language {
    @IsNumber()
    id
    
    @IsString()
    name

    @IsNumber()
    user_id
    
}

export class Role {
    @IsNumber()
    id
    @IsString()
    name
}