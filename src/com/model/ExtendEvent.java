package com.model;

public class ExtendEvent {

    private Integer id;
    private String sportName;
    private Integer eventId;
    private String eventName;
    private String eventCtime;
    private String eventAddress;
    private String eventUnit;
    private Float eventScore;
    private Integer mid;
    private String mname;
    private Integer teamid;
    private String teamname;
    private String mnum;
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSportName() {
        return sportName;
    }

    public void setSportName(String sportName) {
        this.sportName = sportName;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public Integer getTeamid() {
		return teamid;
	}

	public void setTeamid(Integer teamid) {
		this.teamid = teamid;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventCtime() {
        return eventCtime;
    }

    public void setEventCtime(String eventCtime) {
        this.eventCtime = eventCtime;
    }

    public String getEventAddress() {
        return eventAddress;
    }

    public void setEventAddress(String eventAddress) {
        this.eventAddress = eventAddress;
    }

    public String getEventUnit() {
        return eventUnit;
    }

    public void setEventUnit(String eventUnit) {
        this.eventUnit = eventUnit;
    }

    public Float getEventScore() {
        return eventScore;
    }

    public void setEventScore(Float eventScore) {
        this.eventScore = eventScore;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMnum() {
        return mnum;
    }

    public void setMnum(String mnum) {
        this.mnum = mnum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
