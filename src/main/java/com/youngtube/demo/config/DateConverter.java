package com.youngtube.demo.config;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateConverter implements Converter<Date, Date>
{
    @Override
    public Date convert(Date date)
    {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = simpleDateFormat.format(date);
        Date dt = new Date();
        try
        {
            dt = simpleDateFormat.parse(str);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return dt;
    }

    @Override
    public JavaType getInputType(TypeFactory typeFactory)
    {
        return null;
    }

    @Override
    public JavaType getOutputType(TypeFactory typeFactory)
    {
        return null;
    }
}
