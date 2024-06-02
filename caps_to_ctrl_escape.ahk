#SingleInstance

ih := InputHook("B L1 T0.2", "{Esc}")

*CapsLock::
{
	ih.Start()
	reason := ih.Wait()
	if (reason = "Stopped") {
		Send "{Esc}"
	} else if (reason = "Max") {
		Send "{Blind}{Ctrl down}" ih.Input
	}
}

*CapsLock up::
{
	if (ih.InProgress) {
		ih.Stop()
	} else {
		Send "{Ctrl up}"
	}
}
