import { createApp } from './app'
import { DatabaseWrapper } from './databaseWrapper'

const verifyServiceProviderHost = process.env.VERIFY_SERVICE_PROVIDER_HOST || 'http://localhost:50400'
const databaseConnectionString = process.env.DATABASE_CONNECTION_STRING || 'postgesql://localhost:5432/stub_rp_test'
const serviceEntityId = process.env.ENTITY_ID || 'http://vsp.dev-rp.local/SAML2/MD'

const server = createApp(verifyServiceProviderHost, DatabaseWrapper.getDatabaseWrapper(databaseConnectionString), serviceEntityId).listen(process.env.PORT || 3200, function () {
  console.log(`Entity Id set to ${serviceEntityId !== null ? serviceEntityId : 'null (will use verify service provider default)'}`)
  console.log(`Stub RP app listening on port ${server.address().port}!`)
})
