import { Module } from '@nestjs/common';
import { ScriptController } from './script.controller';
import { ScriptService } from './script.service';

@Module({
  controllers: [ScriptController],
  providers:   [ScriptService]
})
export class ScriptModule {
}


// import { Optional, Options } from "@nestjs/common"
// import { IsNumber } from "class-validator"

// export class Script {
//     @Optional()
//     @IsNumber()
//     id	

//     title	        varchar(50)
//     file_size	    decimal(6,3)
//     remarks     	varchar(1000)
//     client_id	    integer
//     url	            varchar(300)
//     date_of_created	datetime
//     date_of_updated	datetime
// }

// export class script_status {
//     id	            integer
//     script_id	    integer
//     post	        boolean
//     deadline	    boolean
//     download_count	decimal(6,3)
//     client_id	    integer
//     date_of_created	datetime
//     date_of_updated	datetime
// }

// export class sentences {
//     id	            integer
//     script_id	    integer
//     context	        varchar(1000)
//     date_of_created	datetime
//     date_of_updated	datetime
// }

// export class sentence_status {
//     id	                    integer
//     sentance_requirement_id	integer
//     deadline_status	        boolean
//     date_of_created	        datetime
//     date_of_updated	        datetime
// }

// export class sentence_requirements {
//     id          	integer
//     language    	varchar(50)
//     age	            integer
//     gender      	varchar(50)
//     sentance_id	    integer
//     voice_id	    integer
//     date_of_created	datetime
//     date_of_updated	datetime
// }
