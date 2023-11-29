---
title: "Nest"
date: 2023-11-27T16:10:31+03:00
draft: false
---

Nest uses Expres under the hood

```bash
npm i -g @nestjs/cli
nest new --strict project-name
```

```bash
# crud generator
nest g resource [name]
```

### Controller
```bash
nest g controller [name]
```

```ts
import { Controller, Get } from '@nestjs/common';

@Controller('cats') // main prefix path
export class CatsController {
  @Post()
  @HttpCode(204) // default 200
  @Header('Cache-Control', 'none') // or inject @Res() res: Response
  @Redirect('https://nestjs.com', 301) // or inject @Res() res.redirect
  create() {
    return 'This action adds a new cat';
  }

  @Get() // auxilary path (allows regex symbols (* acts like .))
  findAll(@Req() req: Request): string { // any method name
    return 'This action returns all cats';
  }

  @Get('observable')
  findAllTemp(): Observable<string[]> { // we can also use Promises
    // returns an observable, which is a stream of data that can be consumed by an entity;
    // nest returs the last emited value
    return new Observable((observer) => {
      observer.next(['1', '2', '3']);
      observer.complete();
    });
  }

  @Get(':id') // should be declared after any static routes
  findOne(@Param() params: any): string {
    // or (@Param('id') id: string)
    console.log(params.id);
    return `This action returns a #${params.id} cat`;
  }
}
```

#### Decorators
`@Get(), @Post(), @Put(), @Delete(), @Patch(), @Options(), @Head() and @All()`

```
@Request(), @Req()	        req
@Response(), @Res()*	    res --> adding this decorator puts a nest to a library specific mode, so the programmer is responsible to call .send() or .json()
> Note: you lose compatibility with Nest features that depend on Nest standard response handling, such as Interceptors and @HttpCode() / @Header() decorators. To fix this, you can set the passthrough option to true
> so you can set cookies etc. but leave all the rest to the framework

@Next()	                    next
@Session()	                req.session
@Param(key?: string)	    req.params / req.params[key]
@Body(key?: string)	        req.body / req.body[key]
@Query(key?: string)	    req.query / req.query[key]
@Headers(name?: string)	    req.headers / req.headers[name]
@Ip()	                    req.ip
@HostParam()	            req.hosts
```

#### DTO (Data transfer object)
We can use TS interfaces, but for more features like "pipes" we should use ES6 classes
```ts
export class CreateCatDto {
  name: string;
  age: number;
  breed: string;
}

....

 @Post()
  create(@Body() createCatDto: CreateCatDto) {
    return 'This action adds a new cat';
  }
```

### Provider
`nest g service cats`  
Can be injected  
Controllers should handle HTTP requests and delegate more complex tasks to providers.  
Providers are plain JavaScript classes that are declared as providers in a module.  


```js
@Injectable()
export class CatsService {
  private readonly cats: Cat[] = [];

  create(cat: Cat) {
    this.cats.push(cat);
  }

  findAll(): Cat[] {
    return this.cats;
  }
}

...

@Controller('cats')
export class CatsController {
  constructor(private catsService: CatsService) {}

  @Post()
  async create(@Body() createCatDto: CreateCatDto) {
    this.catsService.create(createCatDto);
  }

  @Get()
  async findAll(): Promise<Cat[]> {
    return this.catsService.findAll();
  }
}
```

#### Scopes
By default, Nest makes provider to be a singleton, which means that there is only one instance of the provider throughout the application.  
`@Injectable({ scope: Scope.SINGLETON })`
`@Injectable({ scope: Scope.REQUEST })`  
`@Injectable({ scope: Scope.TRANSIENT })`  
`@Injectable({ scope: Scope.DEFAULT })`

#### Custom providers
Providers can include any value not just services
```ts
const connectionFactory = {
  provide: 'CONNECTION', // token
  useFactory: () => {
    const connection = createConnection(options);
    return connection;
  },
};
```

#### Optional providers
```ts
@Injectable()
export class HttpService<T> {
  constructor(@Optional() private httpClient: HttpClient<T>) {}
}
```

#### Mocking providers
```ts
import { CatsService } from './cats.service';

const mockCatsService = {
  /* mock implementation
  ...
  */
};
```

#### Custom names of providers
```ts
@Injectable()
export class CatsRepository { // previously provider was  declared as 'CONNECTION'
  constructor(@Inject('CONNECTION') connection: Connection) {}
}

@Module({
  imports: [CatsModule],
  providers: [
    {
      provide: CatsService, 
      useValue: mockCatsService,
    },
  ],
})
export class AppModule {}
```

#### Dynamic providers (useClass)
```ts
const configServiceProvider = {
  provide: ConfigService,
  useClass:
    process.env.NODE_ENV === 'development'
      ? DevelopmentConfigService
      : ProductionConfigService,
};

@Module({
  providers: [configServiceProvider],
})
export class AppModule {}
```

#### Factory providers (useFactory)
```ts
const connectionProvider = {
  provide: 'CONNECTION',
  useFactory: (optionsProvider: OptionsProvider, optionalProvider?: string) => {
    const options = optionsProvider.get();
    return new DatabaseConnection(options);
  },
  inject: [OptionsProvider, { token: 'SomeOptionalProvider', optional: true }],
  //       \_____________/            \__________________/
  //        This provider              The provider with this
  //        is mandatory.              token can resolve to `undefined`.
};

@Module({
  providers: [
    connectionProvider,
    OptionsProvider,
    // { provide: 'SomeOptionalProvider', useValue: 'anything' },
  ],
})
export class AppModule {}
```
#### Use existing provider (useExisting)
we can use existing provider `useExisting` instead of `useClass` or `useValue`

#### Async providers
```ts
const connectionFactory = {
  provide: 'CONNECTION',
  useFactory: async () => {
    const connection = await createConnection(options);
    return connection;
  },
}; // won't start a module until the promise is resolved
```

### Module
`nest g module cats`  
Module should encapsulate a closely related set of capabilities which are self-contained.
- providers - services (encapsulated by the module, can't be used outside, if not exported)
- controllers - controllers
- imports - other modules
- exports - providers that should be available in other modules

```
src
   cats
     dto
       create-cat.dto.ts
     interfaces
       cat.interface.ts
     cats.controller.ts
     cats.module.ts
     cats.service.ts
  app.module.ts
  main.ts
```

#### Global module
By default we can't use provders from other modules without importing them.
```ts
@Global() // makes module global
@Module({
  imports: [CatsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

#### Dynamic modules
Dynamic module is a module that is created dynamically, at runtime.
```ts
@Module({
  imports: [ConfigModule],
})
export class DatabaseModule {
  static register(options: Options): DynamicModule {
    return {
      module: DatabaseModule, // the onlye required property
      providers: [
        {
          provide: DATABASE_CONNECTION,
          useValue: createDatabaseConnection(options),
        },
      ],
    };
  }
}

...
@Module({
  imports: [
    DatabaseModule.register({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
    }),
  ],
})
```

##### Async dynamic modules
```ts
export const { ConfigurableModuleClass, MODULE_OPTIONS_TOKEN } = new ConfigurableModuleBuilder<ConfigModuleOptions>()
  .setExtras(
    {
      isGlobal: true,
    },
    (definition, extras) => ({
      ...definition,
      global: extras.isGlobal,
    }),
  )
  .build();

...

@Module({
  imports: [
    ConfigurableModuleClass.registerAsync({
      useFactory: async (configService: ConfigService) => ({
        configService,
      }),
      inject: [ConfigService],
    }),
  ],
})
```

### Middleware
Calls before controller
#### Class middleware
```ts
@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    console.log('Request...');
    next();
  }
}
```
Set in module
```ts
@Module({
  imports: [CatsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(LoggerMiddleware)
      .forRoutes('cats'); // path /cats
    // or .forRoutes({ path: 'cats', method: RequestMethod.GET });
    // or .forRoutes(CatsController);
      .exclude(
        { path: 'cats', method: RequestMethod.GET },
        { path: 'cats', method: RequestMethod.POST },
        'cats/(.*)',
      )
  }
}
```

#### Functional middleware
```ts
export function logger(req: Request, res: Response, next: NextFunction) {
  console.log(`Request...`);
  next();
}
```

#### Global middleware
```ts
const app = await NestFactory.create(AppModule);
app.use(logger);
```

### Exception filters
Nest layer will catch all exceptions and return a standard response.  
Nest provides a build-in exceptions (like BadRequestException, etc.)
```ts
@Get()
cats() {
  throw new HttpException('Forbidden', HttpStatus.FORBIDDEN);
}
```

#### Full control
```ts
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse();
    const request = ctx.getRequest();
    const status = exception.getStatus();

    response
      .status(status)
      .json({
        statusCode: status,
        timestamp: new Date().toISOString(),
        path: request.url,
      });
  }
}
```

##### Method scoped level
```ts
@Get()
@UseFilters(new HttpExceptionFilter())
// or
// @UseFilters(HttpExceptionFilter) --> prefered way, Nest would reuse the same instance of the filter
cats() {
  throw new HttpException('Forbidden', HttpStatus.FORBIDDEN);
}
```

##### Controller scoped level
```ts
@UseFilters(new HttpExceptionFilter())
export class CatsController {}
```

##### Global scoped level
It is not possible to inject dependencies into filters when they are declared globally.  
There are workarounds though  
```ts
const app = await NestFactory.create(AppModule);
app.useGlobalFilters(new HttpExceptionFilter());
```


### Pipes (validation/transforming input data)
9 pipes are provided by Nest (throws errors on null or undefined, use new DefaultValuePipe() to set default value)
Transforms input data to the desired form or validates the data.  


#### Binding pipe (parameter scoped)
```ts
@Get(':id')
async findOne(@Param('id', ParseIntPipe) id: number) {
  // or if we want to customize
  // @Param('id', new ParseIntPipe({ errorHttpStatusCode: HttpStatus.NOT_ACCEPTABLE }))
  return this.catsService.findOne(id);
}
```

#### Binding pipe (method scoped)
```ts
@Post()
@UsePipes(new JoiValidationPipe(createCatSchema))
async create(@Body() createCatDto: CreateCatDto) {
  this.catsService.create(createCatDto);
}
```

#### 'class-validator' package
Allows to use decorators to validate DTOs
```ts
import { PipeTransform, Injectable, ArgumentMetadata, BadRequestException } from '@nestjs/common';
import { validate } from 'class-validator';
import { plainToClass } from 'class-transformer';

@Injectable()
export class ValidationPipe implements PipeTransform<any> {
  async transform(value: any, { metatype }: ArgumentMetadata) {
    if (!metatype || !this.toValidate(metatype)) {
      return value;
    }
    const object = plainToClass(metatype, value);
    const errors = await validate(object);
    if (errors.length > 0) {
      throw new BadRequestException('Validation failed');
    }
    return value;
  }

  private toValidate(metatype: Function): boolean {
    const types: Function[] = [String, Boolean, Number, Array, Object];
    return !types.includes(metatype);
  }
}
```


### Guard (authorization/authentication)
Used for authentication and authorization  
@Injectable() + CanActivate  
Guards are executed after all middleware, but before any interceptor or pipe.  
Middleware is dumb, it doesn't know anything about the route, it just executes before the route handler.

```ts
@Controller('cats')
@UseGuards(RolesGuard) // if returns false, Nest will throw a ForbiddenException, which would be handled by the exception layer, or any other exception filter
@Roles('admin') // custom decorator
export class CatsController {
  @Get()
  findAll() {
    return 'This action returns all cats';
  }
}
```

#### Reflector
```ts
@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const roles = this.reflector.get<string[]>('roles', context.getHandler());
    if (!roles) {
      return true;
    }
    const request = context.switchToHttp().getRequest();
    const user = request.user;
    const hasRole = () => user.roles.some((role) => roles.includes(role));

    return user && user.roles && hasRole();
  }
}
```

### Interceptors (aop - aspect oriented programming)
Aop allows to change the behavior of classes, methods, or functions by adding additional code (interceptors) before or after the existing code.
@Injectable + implements NestInterceptor
```ts
@Injectable()
export class LoggingInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    console.log('Before...');

    const now = Date.now();
    return next
      .handle()
      .pipe(
        tap(() => console.log(`After... ${Date.now() - now}ms`)),
      );
  }
}

...

@Get()
@UseInterceptors(LoggingInterceptor)
findAll() {
  return 'This action returns all cats';
}
```

### Custom Decorators
```ts
export const Roles = (...roles: string[]) => SetMetadata('roles', roles);
// later we can combine decorators
@Roles('admin')
@UseGuards(RolesGuard)
@UseGuards(AuthGuard)

// or

export const Auth = (...roles: string[]) => applyDecorators(
  SetMetadata('roles', roles),
  UseGuards(RolesGuard),
  UseGuards(AuthGuard),
);

...

@Auth('admin')
```
