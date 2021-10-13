import { Module } from '@nestjs/common';
import { VoiceController } from './voice.controller';
import { VoiceService } from './voice.service';

@Module({
  controllers: [VoiceController],
  providers:   [VoiceService]
})
export class VoiceModule {}

 // export class voices {
//     id	            integer
//     file_size	    decimal(6,3)
//     description	    varchar(50)
//     url	            varchar(500)
//     user_id	        integer
//     date_of_created	datetime
//     date_of_updated	datetime
// }

// export class voice_status {
//     id      	    integer
//     voice_id	    integer
//     download_count	decimal(6,3)
//     client_id   	integer
//     verify      	varchar(50)
//     user_id	        integer
//     date_of_created	datetime
//     date_of_updated	datetime
// }
