# Writing Good Tests

## Good Test Characteristics
- **Descriptive name**: `test_expired_token_returns_401` not `test_token_1`
- **One behavior per test**: If the name has "and", split it
- **Arrange-Act-Assert**: Clear separation of setup, action, verification
- **Independent**: No test depends on another test's state or ordering
- **Fast**: Unit tests should run in milliseconds

## Bad Test Patterns
- **Testing implementation**: Asserting internal method calls instead of outputs
- **Brittle assertions**: Checking exact error messages or full object equality when only one field matters
- **Setup-heavy**: If setup is 50 lines and assertion is 1, the test is doing too much
- **Assertion-free**: Tests that run code but don't assert anything meaningful
- **Copy-paste tests**: Duplicated tests with one value changed — use parameterized tests

## Test Naming Convention
```
test_[scenario]_[expected_outcome]
```
Examples:
- `test_empty_cart_returns_zero_total`
- `test_duplicate_email_raises_validation_error`
- `test_admin_user_can_delete_posts`

## When a Test Feels Hard to Write
This is a design signal. If testing is painful, the code is probably:
- Doing too many things (split it)
- Tightly coupled to dependencies (inject them)
- Relying on global state (make it explicit)

Don't reach for mocks to make a bad test easy — fix the design instead.
