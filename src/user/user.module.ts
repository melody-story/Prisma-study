import { Module, Controller } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';

@Module({
  controllers: [UserController],
  providers:   [UserService]
})
export class UserModule {}