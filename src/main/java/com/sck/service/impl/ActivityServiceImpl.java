package com.sck.service.impl;

import com.sck.dao.ActivityMapper;
import com.sck.pojo.Activity;
import com.sck.pojo.Stu_act;
import com.sck.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityMapper activityMapper;
    @Override
    public List<Activity> findall() {
        return activityMapper.findall();
    }

    @Override
    public List<Activity> findallFilter(String actName, String act_mana) {
        return activityMapper.findallFilter(actName, act_mana);
    }

    @Override
    public Activity findById(int id) {
        return activityMapper.findById(id);
    }

    @Override
    public int deleactByOrgId(Integer org_id) {
        return activityMapper.deleactByOrgId(org_id);
    }

    @Override
    public List<Activity> findActBynum(String studentnum) {
        return activityMapper.findActBynum(studentnum);
    }

    @Override
    public List<Stu_act> showAct_stuList(Integer act_id) {
        return activityMapper.showAct_stuList(act_id);
    }

    @Override
    public int creatact(Activity activity) {
        return activityMapper.creatact(activity);
    }

    @Override
    public int delact(Integer id) {
        return activityMapper.delact(id);
    }

    @Override
    public int alertact(Activity activity) {
        return activityMapper.alertact(activity);
    }

    @Override
    public List<Activity> findBynames(String actname, String orgname, String stuname) {
        return activityMapper.findBynames(actname, orgname, stuname);
    }
}
