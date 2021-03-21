# An effective testing strategy when your code uses DispatchQueue.main.async

A strategy that lets you test your code that uses DispatchQueue.main.async. The previous method signature identifies the dispatch queue associated with the main thread of the current process and it is usually used when you have to run code that updates the UI, for example. To be sure that your app will not freeze or will not be unresponsive code runs in the main thread.

To demonstrate how to test code that uses DispatchQueue.main.async, you can find a simple application with a view controller and a label that shows a message before and after a loader request has been executed. We won't use a real service but a fake implementation that uses a delay to simulate some network latency
