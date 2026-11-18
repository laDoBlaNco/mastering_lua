--[[
Implementation of Queues

A queue can be implemented in the Lua programming language. Lua is a
flexible and versatile programmingn language that allows us to create
data structures easily


]]
function createQueue()
  return {front=1,rear=0}
end

function isEmpty(queue)
  return queue.front > queue.rear
end

function enqueue(queue,item)
  queue.rear = queue.rear + 1
  queue[queue.rear] = item
end

function dequeue(queue)
  if not isEmpty(queue) then
    local item = queue[queue.front]
    queue[queue.front] = nil
    queue.front = queue.front + 1
    return item
  end
end

function front(queue)
  if not isEmpty(queue) then
    return queue[queue.front]
  end
end

function size(q)
  if not isEmpty(q) then
    return q.rear - q.front + 1
  end
end

myQ = createQueue()

enqueue(myQ,8)
enqueue(myQ,2)
enqueue(myQ,5)
print(front(myQ))
print(dequeue(myQ))
print(front(myQ))