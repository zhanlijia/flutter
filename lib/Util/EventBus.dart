typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = new EventBus._internal();

  factory EventBus() => _singleton;

  var _emap = Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback f) {
    if (f == null || eventName == null) {
      return;
    }

    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) {
      return;
    }

    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) {
      return;
    }

    list.forEach((element) {
      element(arg);
    });
  }
}
